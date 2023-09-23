class JournalLinesController < ApplicationController
  before_action :set_journal_line, only: %i[ show edit update destroy ]

  # GET /journal_lines or /journal_lines.json
  def index
    @journal_lines = JournalLine.all
  end

  # GET /journal_lines/1 or /journal_lines/1.json
  def show
  end

  # GET /journal_lines/new
  def new
    @journal_line = JournalLine.new
  end

  # GET /journal_lines/1/edit
  def edit
  end

  # POST /journal_lines or /journal_lines.json
  def create
    @journal_line = JournalLine.new(journal_line_params)

    respond_to do |format|
      if @journal_line.save
        format.html { redirect_to journal_line_url(@journal_line), notice: "Journal line was successfully created." }
        format.json { render :show, status: :created, location: @journal_line }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @journal_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journal_lines/1 or /journal_lines/1.json
  def update
    respond_to do |format|
      if @journal_line.update(journal_line_params)
        format.html { redirect_to journal_line_url(@journal_line), notice: "Journal line was successfully updated." }
        format.json { render :show, status: :ok, location: @journal_line }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @journal_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journal_lines/1 or /journal_lines/1.json
  def destroy
    @journal_line.destroy

    respond_to do |format|
      format.html { redirect_to journal_lines_url, notice: "Journal line was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal_line
      @journal_line = JournalLine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def journal_line_params
      params.require(:journal_line).permit(:journal_id, :account_id, :debit_cents, :credit_cents)
    end
end
