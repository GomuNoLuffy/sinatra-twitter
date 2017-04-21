class User < ActiveRecord::Base
	has_many :tweets, foreign_key: :user_id, dependent: :destroy
	# has_many :answers, foreign_key: :user_id, dependent: :destroy
 #    has_many :question_votes
 #    has_many :answer_votes
    
    validates :username, uniqueness: true
    validates :username, presence: true
    validates :name, presence: true
	validates :email, uniqueness: true
	validates :email, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Only valid email allowed."}
	validates :password, length: 8..20

	has_secure_password

end

