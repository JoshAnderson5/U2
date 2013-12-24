class DashboardController < ApplicationController

  def home
    def bar_chart
    @data_table = GoogleVisualr::DataTable.new
      data_table.new_column('string', 'Year' ) 
      data_table.new_column('number', 'Sales') 
      data_table.new_column('number', 'Expenses')

      # Add Rows and Values 
      data_table.add_rows([ 
        ['2004', 1000, 400], 
        ['2005', 1170, 460], 
        ['2006', 660, 1120], 
        ['2007', 1030, 540] 
      ])
      option = { width: 400, height: 240, title: 'Company Performance' }
      @chart = GoogleVisualr::Interactive::AreaChart.new(data_table, option)
    end
  end

  def mypresence
    @title = "My Presence"
    @users = (current_user.blank? ? User.all : User.find(:all, :conditions => ["id != ?", current_user.id]))
  end

  def college
  end

  def neighborhoods
  end

  def sellanything
  end

  def referral
  end

##########
  def identity
  end

  def reviews
  end

  def references
  end

  def college_settings
  end

  def neighborhood_settings
  end

  def sellanything_settings
  end
end
