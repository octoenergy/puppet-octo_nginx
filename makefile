bundle:
	bundle config set --local path '.bundle/vendor'
	bundle install

LINT_OPTS=--no-documentation-check --no-autoloader_layout-check
lint:
	bundle exec puppet-lint ${LINT_OPTS} .

lint-fix:
	bundle exec puppet-lint ${LINT_OPTS} --fix .
