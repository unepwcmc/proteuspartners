describe 'Refinery' do
  describe 'Documents' do
    describe 'Document' do
      
      it 'must have a valid document' do
        build(:document).should be_valid
      end

      it 'must have a valid category' do
        build(:category).should be_valid
      end

      it 'must increase counter cache' do
        document = create(:document)

        expect { document.categories.create(title: "Test category") }.to change { Refinery::Documents::Document.last.category_count }.by(1)
      end

      it 'must have a category' do
        document = create(:document)
        
        expect {Refinery::Documents::Document.is_categorised}.to include {document.categories.create(title: "Test category")}
      end

    end
  end
end