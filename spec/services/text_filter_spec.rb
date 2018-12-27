require 'rails_helper'

describe TextFilter do
  subject(:filtered) {TextFilter.new(Category, {name: 'Fiction'}).call}

  before do
    create :category, name: 'Fiction'
    create :category, name: 'Drama'
  end

  describe "exact match" do


    it "filters out single record" do
      expect(filtered.count).to eq(1)
    end

    it "filters record with same field value" do
      expect(filtered.first.name).to eq('Fiction')
    end
  end

  describe "partial match" do
    before do
      create :category, name: 'Science-fiction'
    end

    it "filters out multiple records" do
      expect(filtered.count).to eq(2)
    end

    it "filters record with same field value" do
      expect(filtered.where(name: 'Fiction')).to be_present
    end

    it "filters record with partial match" do
      expect(filtered.where(name: 'Science-fiction')).to be_present
    end
  end

  describe "multiple filters" do
    subject(:filtered) {TextFilter.new(Book, {title: 'Harry Potter', author: 'J.K. Rowling'}).call}

    before do
      create :book, title: 'Other book', author: 'J.K. Rowling'
      @match_book = create :book, title: 'Harry Potter and the Rowling', author: 'J.K. Rowling'
      create :book, title: 'Harry Potter and Ayyyyyy lmao', author: 'other author'
    end

    it "filters out single record" do
      expect(filtered.count).to eq(1)
    end

    it "filters record with all fields matching" do
      expect(filtered.first.id).to eq(@match_book.id)
    end
  end
end