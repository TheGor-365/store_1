require 'spec_helper'

describe ItemsController do
  describe 'show action' do
    it 'renders show template if an item is found' do
      item = create(:item)
      get :show, { id: item.id }

      response.should render_template('show')
    end
  end
end
