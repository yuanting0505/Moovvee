# encoding: utf-8

require 'spec_helper'

describe User do
	before do
		@user=User.new(name:"Example",
			           email:"Example@Moovvee.com",
			           password:"123456",
			           password_confirmation:"123456")
	end

	subject{@user}

	it{ should respond_to(:name)}
	it{ should respond_to(:email)}
	it{ should respond_to(:password)}
	it{ should respond_to(:password_confirmation)}
	it{ should respond_to(:password_digest)}

    it{ should be_valid}
	describe "用户名不能为空" do
		before{@user.name=" "}
		it{ should_not be_valid}
	end

	describe "邮箱不能为空" do
		before{@user.email=" "}
		it{ should_not be_valid}
	end

	describe "密码不能为空" do
		before{@user.password="",@user.password_confirmation=""}
		it{ should_not be_valid}
	end

	describe "邮箱已存在" do
		before do
			@new_user=User.new(name:"new",
				               email:"Example@Moovvee.com",
					           password:"123456",
				               password_confirmation:"123456")
	    @new_user.save
	    end
        it{ should_not be_valid}
	    
	end

	describe "确认密码与密码不一致" do
    	before{@user.password_confirmation="654321"}
		it{ should_not be_valid}		
	end

	describe "密码太短(要求6位或以上)" do
		before do
			@user.password='1'*5
			@user.password_confirmation='1'*5
		end

		it { should_not be_valid}
	end

	describe "名字太长(要求50位以内)" do
		before do
			@user.name='a'*51
		end

		it{ should_not be_valid}
	end

	describe "邮件格式有误" do
		before do
			@user.email="t~@Moovvee.com"
		end

        it{ should_not be_valid}
	end
end
