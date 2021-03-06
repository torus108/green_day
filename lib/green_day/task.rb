# frozen_string_literal: true

module GreenDay
  class Task
    attr_reader :contest, :code, :input_output_hash
    def initialize(contest, code, client)
      @contest = contest
      @code = code
      @input_output_hash = create_input_output_hash(client)
    end

    private

    def create_input_output_hash(client)
      input_samples, output_samples =
        client.fetch_inputs_and_outputs(contest, self)

      hash = {}
      input_samples.zip(output_samples).each do |input, output|
        hash[input] = output
      end

      hash
    end
  end
end
