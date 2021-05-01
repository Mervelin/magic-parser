require './lib/parser'

describe Parser do
  context 'when proper path is provided' do
    let(:path) { './spec/fixtures/test.log' }

    describe '#process_data' do
      subject(:process_data) { Parser.new(path).process_data }

      let(:entries) { ['/home 1.1.1.1'] }
      let(:metrics_class) { instance_double Metrics }

      before do
        expect(File).to receive(:readlines).with(path).and_return(entries)
        expect(Metrics).to receive(:new).with(entries).and_return(metrics_class)
      end

      it 'calls metrics class to calculate' do
        expect(metrics_class).to receive(:calculate)

        process_data
      end
    end

    describe '#entries' do
      subject(:entries) { Parser.new(path).entries }

      it 'retrieves entries from file' do
        expect(entries.first).to eql '/home 1.1.1.1'
      end

      it 'returns entries without newline character' do
        expect(entries.first).not_to include "\n"
      end
    end

    describe '#print_popular_metrics' do
      context 'when data is processed' do
        subject(:parser) { Parser.new(path) }

        before do
          parser.process_data
        end

        it 'prints popular metrics into standard output based on provided entries' do
          expect { parser.print_popular_metrics }
            .to output("\"/home 3 visits\"\n\"/about 2 visits\"\n").to_stdout
        end
      end
    end

    describe '#print_unique_metrics' do
      context 'when data is processed' do
        subject(:parser) { Parser.new(path) }

        before do
          parser.process_data
        end

        it 'prints unique metrics into standard output based on provided entries' do
          expect { parser.print_unique_metrics }
            .to output("\"/about 2 unique views\"\n\"/home 1 unique views\"\n").to_stdout
        end
      end
    end
  end
end