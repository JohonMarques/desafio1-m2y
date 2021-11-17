module Api
    module V1
      class NetflixesController < ApplicationController
        # GET http://localhost:3000/api/v1/netflixes

        def index
          movie = Netflix.order('release_year')
          render json: { status: 'SUCCESS', message: 'Movies List', data: movie }, status: :ok
        end
        
        # GET http://localhost:3000/api/v1/netflixes/1
  
        def show
            movie = Netflix.find(params[:id])
          render json: { status: 'SUCCESS', message: 'Movie Founded', data: movie }, status: :ok
        end

        #POST http://localhost:3000/api/v1/netflixes
  
        def create
            movie = Netflix.new(netflix_params)
          if movie.save
            render json: { status: 'SUCCESS', message: 'Movie Added', data: movie }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Failed to add movie', data: movie.err },
                   status: :unprocessable_entity
          end
        end

        # PUT http://localhost:3000/api/v1/netflixes/1
  
        def update
          movie = Netflix.find(params[:id])
          if movie.update(netflix_params)
            render json: { status: 'SUCCESS', message: 'Movie updated', data: movie }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Movie can not be updated', data: movie },
                   status: :unprocessable_entity
          end
        end

        # DELETE http://localhost:3000/api/v1/netflixes/1

        def destroy
          movie = Netflix.find(params[:id])
          movie.destroy
          render json: { status: 'SUCCESS', message: 'Movie deleted.', data: movie }, status: :ok
        end
  
        private
  
        def netflix_params
          params.permit(:show_id, :type, :title, :director, :cast, :country, :date_added, :release_year, :rating, :duration, :listed_in, :description)
        end
      end
    end
  end
  