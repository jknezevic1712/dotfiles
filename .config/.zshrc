alias ls='ls -GpF'

source "$HOME/dotfiles/.config/.jknezevic_profile"

backup(){
  rm -r ~/backup;
  mkdir ~/backup;

  export PGPASSWORD="admin"

  pg_dump -h localhost --username=postgres gsc-client > ~/backup/dump_backup_client.sql;
  sed -i '' 's/OWNER TO postgres/OWNER TO gscl/' ~/backup/dump_backup_client.sql;
  sed -i '' 's/Owner: postgres/Owner: gscl/' ~/backup/dump_backup_client.sql;
  pg_dump -h localhost -p 5433 --username=postgres gsc-admin > ~/backup/dump_backup_admin.sql;
  sed -i '' 's/OWNER TO postgres/OWNER TO gscl/' ~/backup/dump_backup_admin.sql;
  sed -i '' 's/Owner: postgres/Owner: gscl/' ~/backup/dump_backup_admin.sql;
}

restore(){
  export PGPASSWORD="admin"
  psql -h localhost -d postgres -U postgres -c "drop database \"gsc-client\" with (force);" -c "create database \"gsc-client\";" -c "grant all on database \"gsc-client\" to gscl;"
  psql -h localhost -d postgres -U postgres -c "drop database \"gsc-admin\" with (force);" -c "create database \"gsc-admin\";" -c "grant all on database \"gsc-admin\" to gscl;"
  psql -h localhost -d gsc-client -U postgres -f ~/backup/dump_backup_client.sql
  psql -h localhost -d gsc-admin -U postgres -f ~/backup/dump_backup_admin.sql

  unset PGPASSWORD
}
# Added by Windsurf
export PATH="/Users/jakov.knezevic/.codeium/windsurf/bin:$PATH"

# CLAUDE_CODE - Enable Bedrock integration
export CLAUDE_CODE_USE_BEDROCK=1
export AWS_REGION=us-east-1
export AWS_PROFILE=dev_claude_code

alias reauthclaude="~/.local/bin/claude_aws_auth_local"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

alias python=python3
