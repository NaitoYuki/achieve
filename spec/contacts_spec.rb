require 'rails_helper'

describe Contact do
  # 属性に対し値があれば有効な状態であること
  it "is valid with attributes" do
    contact = Contact.new(name: 'Name', email: 'sample@test.com', content: 'Content')
    expect(contact).to be_valid
  end

  #名前がなければ無効であること
  it "is invalid without a name" do
    contact = Contact.new(email: 'sample@test.com', content: 'Content')
    expect(contact).not_to be_valid
  end

  #Eメールがなければ無効であること
  it "is invalid without a email" do
    contact = Contact.new(name: 'Name', content: 'Content')
    expect(contact).not_to be_valid
  end

  #内容がなければ無効であること
  it "is invalid without a content" do
    contact = Contact.new(name: 'Name', email: 'sample@test.com')
    expect(contact).not_to be_valid
  end

  #属性に対し値がなければ無効であること
  it "is invalid without attributes" do
    contact = Contact.new
    expect(contact).not_to be_valid
  end
end
