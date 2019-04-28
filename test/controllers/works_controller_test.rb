require "test_helper"

describe WorksController do
  let (:work) { works(:one) }

  describe 'index' do 
    it 'can get to index path' do 
      get works_path

      must_respond_with :success
    end
  end  

  describe 'show' do 
    it 'can get to valid work path' do 
      get work_path(work.id)
      must_respond_with :success
    end

    it "will redirect with an invalid work" do
      get work_path(-1)

      must_respond_with :redirect
    end
  end

  describe "new" do 
    it "can get a new work page" do 
      get new_work_path

      must_respond_with :success
    end
  end

  describe "create" do 
    it "can create a new work" do 
      work_hash = {
        work: {
          title: "test work",
          creator: "test creator",
          description: "test description",
          publication_year: 1990,
        },
      }

      expect {
        post works_path, params: work_hash
      }.must_change "Work.count", +1

      new_work = Work.find_by(title: work_hash[:work][:title])
      expect(new_work.creator).must_equal work_hash[:work][:creator]
      expect(new_work.description).must_equal work_hash[:work][:description]

      must_respond_with :redirect
      must_redirect_to work_path(new_work.id)
    end
  end

  describe "edit" do 
    it "canget the edit page for an existing work" do 
      get edit_work_path(work.id)
      must_respond_with :success
    end

    it "will respond with a redirect when attempting to edit a nonexistant path" do 
      get edit_work_path(-1)
      must_redirect_to works_path
    end
  end
end
