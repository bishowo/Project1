name: CI/CD Pipeline

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up Node.js
        uses: actions/setup-node@v2
        with:
          node-version: 14

      - name: Install dependencies
        run: npm install

      - name: Run tests
        run: npm test

      - name: Build
        run: npm build

      - name: Deploy to Staging
        run: |
          # Add your deployment script or commands here
          # For example, deploying to a staging environment using SSH:
          ssh user@staging-server 'cd /path/to/project && git pull origin main && npm install && npm run build && pm2 restart your-app'

      - name: Deploy to Production
        run: |
          # Add your production deployment script or commands here
          # For example, deploying to a production environment using SSH:
          ssh user@production-server 'cd /path/to/project && git pull origin main && npm install && npm run build && pm2 restart your-app'
