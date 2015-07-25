require 'bundler/setup'
require 'minitest/autorun'

# Configure Rails
ENV["RAILS_ENV"] = "test"

require 'active_record'
require 'action_controller'
require 'responders'

$:.unshift File.expand_path('../../lib', __FILE__)
require 'rails_api_filters'

Responders::Routes = ActionDispatch::Routing::RouteSet.new
Responders::Routes.draw do
  resources :artists
end

class ActiveSupport::TestCase
  self.test_order = :random
  
  setup do
    @routes = Responders::Routes
  end
end

class Artist < ActiveRecord::Base
  validates :name, presence: true
end

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)
ActiveRecord::Base.connection.execute <<SQL
  CREATE TABLE "artists" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
                          "name" varchar);
SQL

class ApplicationResponder < ActionController::Responder
end

class ApplicationController < ActionController::Base
  include ActionController::ImplicitRender
  include Responders::Routes.url_helpers

  self.responder = ApplicationResponder
  respond_to :json
end

class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :update, :destroy]

  def index
    @artists = Artist.all
    respond_with(@artists)
  end

  def show
    respond_with(@artist)
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    respond_with(@artist)
  end

  def update
    @artist.update(artist_params)
    respond_with(@artist)
  end

  def destroy
    @artist.destroy
    respond_with(@artist)
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.permit(:name)
    end
end
