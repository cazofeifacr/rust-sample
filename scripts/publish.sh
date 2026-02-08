#!/bin/bash

 # Helper script for publishing to crates.io
 # Usage: ./publish.sh [command]

set -e  

BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

print_help() {
    echo -e "${BOLD}🦀 Crates.io Publish Script${NC}"
    echo ""
    echo "Usage: ./publish.sh [command]"
    echo ""
    echo "Available commands:"
    echo "  check       - Verify everything is ready to publish"
    echo "  test        - Run all tests"
    echo "  package     - Package without publishing"
    echo "  dry-run     - Simulate publishing (no actual publish)"
    echo "  publish     - Publish to crates.io (requires token)"
    echo "  version     - Update version (usage: ./publish.sh version 0.2.0)"
    echo "  tag         - Create git tag for current version"
    echo "  help        - Show this help"
    echo ""
    echo "Example full workflow:"
    echo "  ./publish.sh check"
    echo "  ./publish.sh version 0.2.0"
    echo "  ./publish.sh tag"
    echo "  ./publish.sh publish"
}

check() {
    echo -e "${BOLD}🔍 Verifying project...${NC}"
    echo -e "${YELLOW}→ Running tests...${NC}"
    cargo test
    echo -e "${YELLOW}→ Checking formatting...${NC}"
    cargo fmt -- --check
    echo -e "${YELLOW}→ Running clippy...${NC}"
    cargo clippy -- -D warnings
    echo -e "${YELLOW}→ Checking documentation...${NC}"
    cargo doc --no-deps
    echo -e "${GREEN}✅ All checks passed!${NC}"
}

run_tests() {
    echo -e "${BOLD}🧪 Running tests...${NC}"
    cargo test --verbose
    echo -e "${GREEN}✅ Tests completed!${NC}"
}

package() {
    echo -e "${BOLD}📦 Packaging...${NC}"
    cargo package --list
    cargo package
    echo -e "${GREEN}✅ Package created in target/package/${NC}"
}

dry_run() {
    echo -e "${BOLD}🔍 Simulating publish...${NC}"
    cargo publish --dry-run
    echo -e "${GREEN}✅ Dry run completed! Everything looks good.${NC}"
}

publish() {
    echo -e "${BOLD}🚀 Publishing to crates.io...${NC}"
    # Check if user has token configured
    if ! grep -q "token" ~/.cargo/credentials.toml 2>/dev/null; then
        echo -e "${RED}❌ Error: crates.io token not found${NC}"
        echo "Please run: cargo login <your-token>"
        exit 1
    fi
    echo -e "${YELLOW}Are you sure you want to publish? (y/n)${NC}"
    read -r response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        cargo publish
        echo -e "${GREEN}✅ Successfully published to crates.io!${NC}"
    else
        echo -e "${YELLOW}Publish cancelled.${NC}"
    fi
}

update_version() {
    if [ -z "$1" ]; then
        echo -e "${RED}❌ Error: You must specify a version${NC}"
        echo "Usage: ./publish.sh version 0.2.0"
        exit 1
    fi
    NEW_VERSION=$1
    echo -e "${BOLD}📝 Updating version to ${NEW_VERSION}...${NC}"
    # Update in Cargo.toml (macOS compatible)
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s/^version = .*/version = \"$NEW_VERSION\"/" Cargo.toml
    else
        sed -i "s/^version = .*/version = \"$NEW_VERSION\"/" Cargo.toml
    fi
    echo -e "${GREEN}✅ Version updated in Cargo.toml${NC}"
    echo -e "${YELLOW}Don't forget to commit the changes:${NC}"
    echo "  git add Cargo.toml"
    echo "  git commit -m 'Bump version to $NEW_VERSION'"
}

create_tag() {
    # Read current version from Cargo.toml
    VERSION=$(grep "^version" Cargo.toml | head -1 | cut -d'"' -f2)
    TAG="v$VERSION"
    echo -e "${BOLD}🏷️  Creating tag ${TAG}...${NC}"
    git tag -a "$TAG" -m "Release version $VERSION"
    echo -e "${GREEN}✅ Tag $TAG created!${NC}"
    echo -e "${YELLOW}To push the tag:${NC}"
    echo "  git push origin $TAG"
    echo ""
    echo -e "${YELLOW}This will trigger the automatic publish workflow in GitHub Actions${NC}"
}

# Command processing
case "${1:-help}" in
    check)
        check
        ;;
    test)
        run_tests
        ;;
    package)
        package
        ;;
    dry-run)
        dry_run
        ;;
    publish)
        publish
        ;;
    version)
        update_version "$2"
        ;;
    tag)
        create_tag
        ;;
    help|*)
        print_help
        ;;
esac
