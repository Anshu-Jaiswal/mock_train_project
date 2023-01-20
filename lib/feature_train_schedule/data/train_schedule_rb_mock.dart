const mockTrainScheduleJson = '''
{
  "TrainName": "12185/Rewanchal Express",
  "TrainNo": 12185,
  "TrainNumberString": "12185",
  "TrainType": "SUF",
  "Source": "Rani Kamlapati",
  "Destination": "Rewa",
  "SourceCode": "RKMP",
  "DestinationCode": "REWA",
  "DaysOfRun": {
    "Mon": true,
    "Tue": true,
    "Wed": true,
    "Thu": true,
    "Fri": true,
    "Sat": true,
    "Sun": true
  },
  "Classes": [
    "GEN",
    "2A",
    "1A",
    "3A",
    "SL"
  ],
  "Schedule": [
    {
      "StationName": "Rani Kamlapati",
      "StationCode": "RKMP",
      "StopNumber": 1,
      "ArrivalTime": "SOURCE",
      "DepartureTime": "22:00",
      "HaltMinutes": "00:00",
      "Day": 1,
      "DistanceFromOrigin": "0 kms",
      "ExpectedPlatformNo": "5"
    },
    {
      "StationName": "Bhopal Jn",
      "StationCode": "BPL",
      "StopNumber": 2,
      "ArrivalTime": "22:10",
      "DepartureTime": "22:15",
      "HaltMinutes": "05:00",
      "Day": 1,
      "DistanceFromOrigin": "6 kms",
      "ExpectedPlatformNo": "3"
    },
    {
      "StationName": "Vidisha",
      "StationCode": "BHS",
      "StopNumber": 3,
      "ArrivalTime": "22:58",
      "DepartureTime": "23:00",
      "HaltMinutes": "02:00",
      "Day": 1,
      "DistanceFromOrigin": "60 kms",
      "ExpectedPlatformNo": "1"
    },
    {
      "StationName": "Ganj Basoda",
      "StationCode": "BAQ",
      "StopNumber": 4,
      "ArrivalTime": "23:28",
      "DepartureTime": "23:30",
      "HaltMinutes": "02:00",
      "Day": 1,
      "DistanceFromOrigin": "99 kms",
      "ExpectedPlatformNo": "1"
    },
    {
      "StationName": "Mandi Bamora",
      "StationCode": "MABA",
      "StopNumber": 5,
      "ArrivalTime": "00:01",
      "DepartureTime": "00:02",
      "HaltMinutes": "01:00",
      "Day": 2,
      "DistanceFromOrigin": "128 kms",
      "ExpectedPlatformNo": "1"
    },
    {
      "StationName": "Bina Jn",
      "StationCode": "BINA",
      "StopNumber": 6,
      "ArrivalTime": "00:30",
      "DepartureTime": "00:35",
      "HaltMinutes": "05:00",
      "Day": 2,
      "DistanceFromOrigin": "145 kms",
      "ExpectedPlatformNo": "3"
    },
    {
      "StationName": "Khurai",
      "StationCode": "KYE",
      "StopNumber": 7,
      "ArrivalTime": "01:08",
      "DepartureTime": "01:10",
      "HaltMinutes": "02:00",
      "Day": 2,
      "DistanceFromOrigin": "167 kms",
      "ExpectedPlatformNo": "2"
    },
    {
      "StationName": "Saugor",
      "StationCode": "SGO",
      "StopNumber": 8,
      "ArrivalTime": "01:50",
      "DepartureTime": "01:55",
      "HaltMinutes": "05:00",
      "Day": 2,
      "DistanceFromOrigin": "220 kms",
      "ExpectedPlatformNo": "1"
    },
    {
      "StationName": "Damoh",
      "StationCode": "DMO",
      "StopNumber": 9,
      "ArrivalTime": "03:08",
      "DepartureTime": "03:10",
      "HaltMinutes": "02:00",
      "Day": 2,
      "DistanceFromOrigin": "296 kms",
      "ExpectedPlatformNo": "2"
    },
    {
      "StationName": "Katni Murwara",
      "StationCode": "KMZ",
      "StopNumber": 10,
      "ArrivalTime": "04:30",
      "DepartureTime": "04:40",
      "HaltMinutes": "10:00",
      "Day": 2,
      "DistanceFromOrigin": "406 kms",
      "ExpectedPlatformNo": "1"
    },
    {
      "StationName": "Maihar",
      "StationCode": "MYR",
      "StopNumber": 11,
      "ArrivalTime": "05:38",
      "DepartureTime": "05:40",
      "HaltMinutes": "02:00",
      "Day": 2,
      "DistanceFromOrigin": "470 kms",
      "ExpectedPlatformNo": "1"
    },
    {
      "StationName": "Unchhera",
      "StationCode": "UHR",
      "StopNumber": 12,
      "ArrivalTime": "05:48",
      "DepartureTime": "05:50",
      "HaltMinutes": "02:00",
      "Day": 2,
      "DistanceFromOrigin": "485 kms",
      "ExpectedPlatformNo": "1"
    },
    {
      "StationName": "Satna Jn",
      "StationCode": "STA",
      "StopNumber": 13,
      "ArrivalTime": "06:40",
      "DepartureTime": "06:45",
      "HaltMinutes": "05:00",
      "Day": 2,
      "DistanceFromOrigin": "506 kms",
      "ExpectedPlatformNo": "2"
    },
    {
      "StationName": "Rewa",
      "StationCode": "REWA",
      "StopNumber": 14,
      "ArrivalTime": "08:00",
      "DepartureTime": "DESTINATION",
      "HaltMinutes": "00:00",
      "Day": 2,
      "DistanceFromOrigin": "555 kms",
      "ExpectedPlatformNo": "2"
    }
  ],
  "TotalDuration": 600,
  "TotalDistance": "555 kms",
  "TotalNumberOfStops": "14"
}
''';
