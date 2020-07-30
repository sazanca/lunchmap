class Price < ActiveHash::Base
  self.data = [
    { id: 1, value: '500'},
    { id: 2, value: '750'},
    { id: 3, value: '900'},
    { id: 4, value: '1200'},
    { id: 5, value: '1500'}
  ]
end