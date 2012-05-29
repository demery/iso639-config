class ManuscriptsController < ApplicationController
  # GET /manuscripts
  # GET /manuscripts.json
  def index
    @manuscripts = Manuscript.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @manuscripts }
    end
  end

  # GET /manuscripts/1
  # GET /manuscripts/1.json
  def show
    @manuscript = Manuscript.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manuscript }
    end
  end

  # GET /manuscripts/new
  # GET /manuscripts/new.json
  def new
    @manuscript = Manuscript.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manuscript }
    end
  end

  # GET /manuscripts/1/edit
  def edit
    @manuscript = Manuscript.find(params[:id])
  end

  # POST /manuscripts
  # POST /manuscripts.json
  def create
    @manuscript = Manuscript.new(params[:manuscript])

    respond_to do |format|
      if @manuscript.save
        format.html { redirect_to @manuscript, notice: 'Manuscript was successfully created.' }
        format.json { render json: @manuscript, status: :created, location: @manuscript }
      else
        format.html { render action: "new" }
        format.json { render json: @manuscript.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /manuscripts/1
  # PUT /manuscripts/1.json
  def update
    @manuscript = Manuscript.find(params[:id])

    respond_to do |format|
      if @manuscript.update_attributes(params[:manuscript])
        format.html { redirect_to @manuscript, notice: 'Manuscript was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @manuscript.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manuscripts/1
  # DELETE /manuscripts/1.json
  def destroy
    @manuscript = Manuscript.find(params[:id])
    @manuscript.destroy

    respond_to do |format|
      format.html { redirect_to manuscripts_url }
      format.json { head :ok }
    end
  end
end
