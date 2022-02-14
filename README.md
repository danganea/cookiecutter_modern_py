# Minimal modern Python cookiecutter.

This is a minimal cookiecutter for setting up modern Python projects. It's useful when you want to quickly whip up a demo/test project but still want to get all the benefits of linting, auto-formatting, modern package management and a minimal Dockerfile.

Since it is both very minimal and very opinionated, it does not come with any custom configuration when running cookiecutter.

The project includes:

- Poetry for package management.
- Pytest
- Black
- Mypy
- Flake
- Pre-commit hooks for some of the above.
- Minimal Dockerfile setting up Poetry and copying the current directory into it for easy development.
