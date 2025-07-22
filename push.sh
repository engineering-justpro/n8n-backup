npx n8n export:workflow --backup --output /backup/workflows/
npx n8n export:credentials --backup --output /backup/credentials/

git config --global user.name '$GITHUB_USERNAME'
git config --global user.email ''
git config --global --add safe.directory /backup

cd /backup

git remote set-url origin https://$GITHUB_N8N_BACKUP_TOKEN@github.com/engineering-justpro/n8n-backup.git
git add .
git commit -m "Auto backup ($(TZ='Asia/Shanghai' date +"%Y-%m-%d %H:%M:%S"))"
git push