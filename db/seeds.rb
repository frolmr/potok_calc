loans_data = [
  {
    body: 1_000_000,
    payments: [
      191_666.67,
      191_666.67,
      191_666.67,
      191_666.67,
      191_666.67,
      191_666.65
    ]
  },
  {
    body: 1_000_000,
    payments: [
      191_666.67,
      191_666.67,
      191_666.67,
      525_000.00
    ]
  },
  {
    body: 1_000_000,
    payments: [
      191_666.67,
      191_666.67,
      208_333.33,
      208_333.33,
      208_333.33,
      208_333.33
    ]
  }
]

loans_data.each do |loan|
  Loan.create(body: loan[:body], payments: loan[:payments])
end
