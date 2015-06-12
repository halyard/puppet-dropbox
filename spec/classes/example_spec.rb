require 'spec_helper'

describe 'dropbox' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "dropbox class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('dropbox::params') }
          it { is_expected.to contain_class('dropbox::install').that_comes_before('dropbox::config') }
          it { is_expected.to contain_class('dropbox::config') }
          it { is_expected.to contain_class('dropbox::service').that_subscribes_to('dropbox::config') }

          it { is_expected.to contain_service('dropbox') }
          it { is_expected.to contain_package('dropbox').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'dropbox class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('dropbox') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
