# Public: Configuration values for ruby
class ruby::params {
  case $::osfamily {
    'Darwin': {
      include boxen::config

      $chruby_root   = "${boxen::config::home}/chruby"
      # If you change this you're going to have a bad time, because chruby sets
      # $RUBIES by default to include all the directories in $PREFIX/opt/rubies
      $chruby_rubies = "${chruby_root}/opt/rubies"
      $user          = $::boxen_user
    }

    default: {
      $chruby_root   = '/usr/local/share/chruby'
      $chruby_rubies = '/opt/rubies'
      $user          = 'root'
    }
  }

  $chruby_version = '0.3.6'

  $default_gems = ['bundler ~>1.3']

  $rubybuild_version = 'v20130628'

  #$rbenv_plugins = {
  #  'ruby-build' => {
  #    'ensure' => 'v20130628',
  #    'source' => 'sstephenson/ruby-build'
  #  },
  #  'rbenv-gem-rehash' => {
  #    'ensure' => 'v1.0.0',
  #    'source' => 'sstephenson/rbenv-gem-rehash'
  #  },
  #  'rbenv-default-gems' => {
  #    'ensure' => 'v1.0.0',
  #    'source' => 'sstephenson/rbenv-default-gems'
  #  }
  #}
}
