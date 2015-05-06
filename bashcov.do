redo-ifchange Gemfile Gemfile.lock
bundle install --path .ruby > /dev/null
chmod +x "$3"
echo "#!/bin/sh"
echo "bundle exec bashcov \$*"
