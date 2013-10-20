#!/usr/bin/env rake

task :default => [:shims]

task :shims => [:default_shims, :extended_shims]

DEFAULT_SENSIBLE_SHIMS = %w(browser editor pager visual)
EXTRA_SENSIBLE_SHIMS = %w(mixer terminal x-terminal)

def make_shim(shim)
  ln_s "sensible-shim",          "bin/#{shim}",          :force => true
  ln_s "sensible-prefixed-shim", "bin/sensible-#{shim}", :force => true
end

desc "Generate the default sensible shims"
task :default_shims do
  DEFAULT_SENSIBLE_SHIMS.each { |shim|
    make_shim shim
  }
end

desc "Generate the extra sensible shims"
task :extended_shims do
  EXTRA_SENSIBLE_SHIMS.each { |shim|
    make_shim shim
  }
end

