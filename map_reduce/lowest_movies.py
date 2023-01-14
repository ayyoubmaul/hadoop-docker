from pyspark import SparkConf, SparkContext


def loadMovieNames():
    movieNames = {}

    with open('data/u.item') as f:
        for line in f:
            fields = line.split('|')

            movieNames[int(fields[0])] = fields[1]

    return movieNames

def parseInput(line):
    fields = line.split('|')

    return (int(fields[1]), (float(fields[2], 1.0)))

if __name__ == '__main__':
    conf = SparkConf().setAppName('WorstMovies')
    sc = SparkContext(conf=conf)

    movieNames = loadMovieNames()

    lines = sc.textFile('hdfs:///user/ds/u.data')

    movieRatings = lines.map(parseInput)

        # Reduce to (movieID, (sumOfRatings, totalRatings))
    ratingTotalsAndCount = movieRatings.reduceByKey(lambda movie1, movie2: ( movie1[0] + movie2[0], movie1[1] + movie2[1] ) )

    # Map to (rating, averageRating)
    averageRatings = ratingTotalsAndCount.mapValues(lambda totalAndCount : totalAndCount[0] / totalAndCount[1])

    # Sort by average rating
    sortedMovies = averageRatings.sortBy(lambda x: x[1])

    # Take the top 10 results
    results = sortedMovies.take(10)

    # Print them out:
    for result in results:
        print(movieNames[result[0]], result[1])
