# check httpd package is installed
describe package 'httpd' do
  it { should be_installed }
end

# check if httpd is enabled and running
describe service 'httpd' do
  it { should be_running }
  it { should be_enabled }
end

# check if port 80 is listening
describe port 80 do
  it { should be_listening }
end
