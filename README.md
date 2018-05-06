# Docker Files

## General Commands

Here are some reminders for general docker commands:

1. **Remove "None" images:**

    docker rmi $(docker images -f “dangling=true” -q)