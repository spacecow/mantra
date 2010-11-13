require 'cucumber/formatter/pretty'
require 'cucumber/ast/table'

module Awesome
  class ExamplesFormatter < Cucumber::Formatter::Pretty
    def before_outline_table(outline_table)
#      p outline_table.class
      #      p outline_table.to_s
#      p outline_table.rows_hash
 #     @table = outline_table
    end
  end
end
