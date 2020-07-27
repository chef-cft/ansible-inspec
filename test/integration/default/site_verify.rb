# check httpd package is installed
describe package 'httpd' do
  it { should be_installed }
end

describe service 'httpd' do
  it { should be_running }
  it { should be_enabled }
end

describe port 80 do
  it { should be_listening }
end
