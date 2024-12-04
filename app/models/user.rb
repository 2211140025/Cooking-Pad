class User < ApplicationRecord
    validates :user_id, presence: true, uniqueness: { message: "すでにそのIDは使われています" }
end
