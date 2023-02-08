from mrjob.job import MRJob
from mrjob.step import MRStep


class SalesAverage(MRJob):

    def steps(self):
        return [
            MRStep(
                mapper=self.mapper_by_product,
                reducer=self.reducer_average_price
            ),
            MRStep(
                reducer=self.reducer_sort_average
            )
        ]

    def mapper_by_product(self, _, line):
        data = line.split(',')

        if data[3] != 'Price Each' and data[3] != '':
            product = data[1]
            price = float(data[3])
            yield product, price

    def reducer_average_price(self, key, value):
        total_data = 0
        total_price = 0

        for price in value:
            total_data += 1
            total_price += price

        yield None, ('{:.2f}'.format(float(total_price/total_data)), key)

    def reducer_sort_average(self, _, values):
        for average, key in sorted(values, key=lambda x: (float(x[0]), x[1])):
            with open('output_sales_mapred.csv', 'a') as f:
                f.write(f'{key}, {average}\n')

            yield key, average

if __name__ == '__main__':
    SalesAverage.run()
