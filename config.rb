class Config
  BASIC_SALE_TAX = 0.1  # 10%
  IMPORT_DUTY    = 0.05 # 5%
  NO_TAX         = 0.0  # 0%
  CATEGORY_EXCEPTIONS = ['books', 'food', 'medical']
  CATEGORIES = [
    { name: 'pill',      category: 'medical' },
    { name: 'book',      category: 'books' },
    { name: 'chocolate', category: 'food' },
    { name: 'imported',  category: 'imported' }
  ]
end
