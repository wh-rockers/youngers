class User
  module Role
    extend ActiveSupport::Concern
    def admin?
      roles.include? 'admin'
    end

    def admin!
      unless roles.include? 'admin'
        update_attributes roles: self.roles + ['admin']
      end
    end

    #website contributor
    def member?
      roles.include? 'member'
    end

    def member!
      update_attributes roles: self.roles + ['member'] unless roles.include? 'member'
    end
  end
end