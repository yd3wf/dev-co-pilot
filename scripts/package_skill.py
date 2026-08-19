#!/usr/bin/env python3
"""Validate and package a CodeBuddy skill into a distributable zip.

Usage:
    python scripts/package_skill.py <path/to/skill-folder> [output-dir]
"""

import sys
import os
import re
import zipfile


REQUIRED = {"SKILL.md"}
VALID_DIRS = {"scripts", "references", "assets"}


def validate(skill_dir):
    errors = []

    # 1. Required files
    for f in REQUIRED:
        if not os.path.isfile(os.path.join(skill_dir, f)):
            errors.append(f"missing required file: {f}")

    # 2. Directory name matches skill name
    skill_name = os.path.basename(os.path.normpath(skill_dir))
    if not re.match(r"^[a-z0-9][a-z0-9-]*$", skill_name):
        errors.append(
            f"invalid skill name '{skill_name}': use lowercase letters, digits, hyphens"
        )

    # 3. YAML frontmatter in SKILL.md
    skill_md = os.path.join(skill_dir, "SKILL.md")
    if os.path.isfile(skill_md):
        with open(skill_md, "r", encoding="utf-8") as fh:
            content = fh.read()
        m = re.match(r"^---\n(.*?)\n---\n", content, re.S)
        if not m:
            errors.append("SKILL.md must start with YAML frontmatter (--- ... ---)")
        else:
            fm = m.group(1)
            if not re.search(r"^name:\s*\S", fm, re.M):
                errors.append("frontmatter missing required field: name")
            if not re.search(r"^description:\s*\S", fm, re.M):
                errors.append("frontmatter missing required field: description")
            if not re.search(r"^name:\s*" + re.escape(skill_name) + r"\s*$", fm, re.M):
                errors.append("frontmatter name must match the directory name")

    # 4. Top-level entries
    for entry in os.listdir(skill_dir):
        full = os.path.join(skill_dir, entry)
        if os.path.isdir(full) and entry not in VALID_DIRS:
            errors.append(f"unknown top-level directory: {entry}")

    return errors


def package(skill_dir, out_dir):
    os.makedirs(out_dir, exist_ok=True)
    skill_name = os.path.basename(os.path.normpath(skill_dir))
    zip_path = os.path.join(out_dir, f"{skill_name}.zip")
    with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as zf:
        for root, _, files in os.walk(skill_dir):
            for fname in files:
                full = os.path.join(root, fname)
                arc = os.path.join(skill_name, os.path.relpath(full, skill_dir))
                zf.write(full, arc)
    return zip_path


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)
    skill_dir = os.path.abspath(sys.argv[1])
    out_dir = os.path.abspath(sys.argv[2]) if len(sys.argv) > 2 else "./dist"

    if not os.path.isdir(skill_dir):
        print(f"ERROR: not a directory: {skill_dir}")
        sys.exit(1)

    errors = validate(skill_dir)
    if errors:
        print("Validation FAILED:")
        for e in errors:
            print(f"  - {e}")
        sys.exit(1)

    zip_path = package(skill_dir, out_dir)
    print("Validation passed.")
    print(f"Packaged -> {zip_path}")


if __name__ == "__main__":
    main()
