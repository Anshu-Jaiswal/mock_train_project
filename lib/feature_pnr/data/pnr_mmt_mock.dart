const mockPnrJson = '''
{
  "TrainDetails": {
    "Train": {
      "Number": "20934",
      "Name": "DNR UDHNA SF EX"
    },
    "ChartPrepared": true
  },
  "StationDetails": {
    "BoardingPoint": {
      "name": "Buxar Railway Station",
      "code": "BXR"
    },
    "ReservationUpto": {
      "name": "Itarsi Jn Railway Station",
      "code": "ET"
    }
  },
  "PnrDetails": {
    "Pnr": "6513425919",
    "Class": "2A",
    "SourceDoj": {
      "FormattedDate": "25-12-2022"
        },
        "Quota": "TQ"
  },
  "PassengerDetails": {
    "PassengerStatus": [
      {
        "BookingBerthNo": "2",
        "BookingCoachId": "A2",
        "BookingStatusNew": "CNF",
        "CurrentBerthNo": "2",
        "CurrentCoachId": "A2",
        "CurrentStatusNew": "CNF",
        "CurrentStatus": "CNF  A2  2"
        
      },
      {
        "BookingBerthNo": "4",
        "BookingCoachId": "A2",
        "BookingStatusNew": "CNF",
        "CurrentBerthNo": "4",
        "CurrentCoachId": "A2",
        "CurrentStatusNew": "CNF",
        "CurrentStatus": "CNF  A2  4"
      }
    ]
  }
}
''';
