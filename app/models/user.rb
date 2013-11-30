class User < ActiveRecord::Base
	has_secure_password
	validates :password,presence:true,length:{minimum:6}

	validates :name, presence:true,length:{maximum:50}

    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z0-9\-.]+\.[a-z0-9]+\z/i
	validates :email, presence:true,
	                 uniqueness:{case_sensitive:false},
	                 format:{with: VALID_EMAIL_REGEX }
    before_save {self.email=email.downcase}

end
