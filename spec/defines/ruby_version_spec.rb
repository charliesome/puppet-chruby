require 'spec_helper'

describe 'ruby::version' do
  let(:facts) { default_test_facts }
  let(:title) { '1.9.3-p194' }

  context "ensure => present" do
    context "default params" do
      it do
        should include_class('ruby')

        should contain_exec('ruby-build-1.9.3-p194').with({
          :command  => "/test/boxen/chruby/ruby-build/bin/ruby-build 1.9.3-p194 /test/boxen/chruby/opt/rubies/1.9.3-p194",
          :cwd      => '/test/boxen/chruby/opt/rubies',
          :provider => 'shell',
          :timeout  => 0,
          :creates  => '/test/boxen/chruby/opt/rubies/1.9.3-p194'
        })
      end
    end

    context "when env is default" do
      it do
        should contain_exec('ruby-build-1.9.3-p194').with_environment([
          "CC=/usr/bin/cc",
        ])
      end
    end

    context "when env is not nil" do
      let(:params) do
        {
          :env => {'SOME_VAR' => "flocka"}
        }
      end

      it do
        should contain_exec('ruby-build-1.9.3-p194').with_environment([
          "CC=/usr/bin/cc",
          "SOME_VAR=flocka",
        ])
      end
    end
  end

  context "ensure => absent" do
    let(:params) do
      {
        :ensure => 'absent'
      }
    end

    it do
      should contain_file('/test/boxen/chruby/opt/rubies/1.9.3-p194').with({
        :ensure => 'absent',
        :force  => true
      })
    end
  end
end
