require 'spec_helper'

RSpec.describe './best_way' do
  let(:output) { `#{command}` }
  describe 'mandatory arguments sign in' do
    context 'when both arguments are not good letter' do
      let(:command) { 'ruby ./best_way.rb g h' }
      it { expect(output).to include('ArgumentSignError') }
    end
    context 'when first argument != a b c d e f' do
      let(:command) { 'ruby ./best_way.rb g a' }
      it { expect(output).to include('ArgumentSignError') }
    end
    context 'when second argument != a b c d e f' do
      let(:command) { 'ruby ./best_way.rb a g' }
      it { expect(output).to include('ArgumentSignError') }
    end
  end
end
