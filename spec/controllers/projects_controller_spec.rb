require 'spec_helper'

describe ProjectsController do
  let(:valid_attributes) { { :title => 'Title',
                             :description => 'Description',
                             :status => 'active' } }
  let(:valid_session) { {} }

  it 'should render index page for projects' do
    get :index
    expect(response).to render_template 'index'
  end

  it 'should assign variables to be rendered by view' do
    projects = [ double(Project), double(Project) ]
    Project.stub(:all).and_return(projects)
    get :index
    expect(assigns(:projects)).to eq projects
  end

  it 'should render a new project page' do
    get :new
    expect(response).to render_template 'new'
  end

  #it 'should assign the requested project as @project' do
  #  project = Project.create! valid_attributes
  #  get :show, {:id => project.to_param}, valid_session
  #  assigns(:project).should eq(project)
  #end

  context 'destroy' do
    it 'should delete a project' do
      project = double(Project)
      ProjectsController.should_receive(:set_project)
      delete :destroy
      expect(project).to receive(:destroy)
      
      #project = Project.create! valid_attributes
      #debugger
      #expect {
      #  delete :destroy, {:id => project.to_param}, valid_session
      #}.to change(Project, :count).by(-1)
    end
  end
end

