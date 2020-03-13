require_relative 'spec_helper.rb'
require_relative '../lib/game_runner.rb'

RSpec.describe Game, "#run" do
  context "on start up" do
    it "renders an empty grid on the screen" do
      game = Game.new
      horizontal_line = "  __ __ __"
      vertical_line = " |  |  |  |"
      both_lines = ' |__|__|__|'
      new_line = "\n"

      game.run

      expect(output).to eq((horizontal_line + new_line + vertical_line + new_line + both_lines + new_line)*3)

    end
  end
end
