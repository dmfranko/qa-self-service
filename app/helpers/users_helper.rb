require 'net/ldap' # gem install ruby-net-ldap
module UsersHelper
    def directory_info(netid)
    conn = Net::LDAP.new :host => "directory.yale.edu",
                         :port => 389,
                         :base => 'ou=People,o=yale.edu'
    if conn.bind
      filter = Net::LDAP::Filter.eq("uid",netid)
      entry  = conn.search(:filter => filter) 
      puts entry.first.cn
      puts entry.first.mail
    else
    end
  end
end
