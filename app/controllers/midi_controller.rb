class MidiController < ApplicationController
  def upload
    Rails.logger.debug "*" * 90
    Rails.logger.debug params[:file].original_filename.length
    seq = file_to_seq(params[:file].original_filename)
    render text: 'yo'
  end

  private

  def file_to_seq(filename)
    # Create a new, empty sequence.
    seq = MIDI::Sequence.new()

    File.open(filename, 'rb') do |file| 
      seq.read(file) { |track, num_tracks, i| puts "read track #{ i } of #{ num_tracks }" }
    end

    seq
  end
end
