// If we have an data from API source we can easily fetch data from there using network calls
// But currently as we don't have that API we will be using this source to fetch the data
// And Images through Network.

class DataSource {
  static final Map<String, Map<String, String>> data = {
    'mint': {
      'subtitle': 'grow your savings. 3x faster',
      'imagePath': 'https://drive.google.com/uc?id=1MjJmXzuQItHGhCbx12aWNmhEahafFz6-',
    },
    'bank accounts': {
      'subtitle': 'check your bank balance',
      'imagePath': 'https://drive.google.com/uc?id=1GUV5m6x0MR5Zdx2hwxQV0aNrnVDl0gqj',
    },
    'Scan n Pay': {
      'subtitle': 'ability to scan n pay on UPI QRs',
      'imagePath': 'https://drive.google.com/uc?id=1tN6AxZ2CDbapkZv9ReptPa-8ArIdvKdI',
    },
    'rewards': {
      'subtitle': 'redeem coins for cashback, discounts and more',
      'imagePath': 'https://drive.google.com/uc?id=1XnJoJLbSu69fLvgqgKya6Cq29LyF9WNK',
    },
    'refer & earn': {
      'subtitle': 'assured cashback and discounts for bringing friends to cred',
      'imagePath': 'https://drive.google.com/uc?id=1E4n9lfENO_-d2hT7TNAD86fmPd-Jy6bn',
    },
    'coins': {
      'subtitle': 'use coins for cashback, discount and more',
      'imagePath': 'https://drive.google.com/uc?id=1XU96QTGIY0bU5Y2_mwKL_lSFGoRNtxWO',
    },
    'vouchers': {
      'subtitle': 'vouchers you have won',
      'imagePath': 'https://drive.google.com/uc?id=1nnYJmvk26KQ1VvEAnEI3TPkV2K3yRLLj',
    },
    'brand offers': {
      'subtitle': 'get exclusive offers on brand while using cred pay',
      'imagePath': 'https://drive.google.com/uc?id=1CFiNr3oqVIcyLY83mwMfO2l_1fbp_twv',
    },
    'utility & all bills': {
      'subtitle': 'the most rewarding way to pay your bills',
      'imagePath': 'https://drive.google.com/uc?id=13IcGZu4GJKG9Jvr2CquXRZS-SwzbYv24',
    },
    'credit card bills': {
      'subtitle': 'pay your credit card bills instantly',
      'imagePath': 'https://drive.google.com/uc?id=1u8qbM9vmUwRZMpxWBj0v3ikv-LSJ7qDf',
    },
    'house rent': {
      'subtitle': 'pay rent with your credit card',
      'imagePath': 'https://drive.google.com/uc?id=1cKBo5bcHlqV54Vc8XTKA5VeToxJT-9Zp',
    },
    'Business Expenses': {
      'subtitle': 'BizExp',
      'imagePath': 'https://drive.google.com/uc?id=1G1XvAnN-ZqZnXaJu9RhKyngvX7KAd6nO',
    },
  };

  static String getLandingTitle() => 'Demo Landing Title'; // Default title
  static String getLandingSubtitle() => 'Demo Landing Subtitle'; // Default subtitle
  static String getLandingImagePath() =>
      'https://drive.google.com/uc?export=view&id=18ixcAEnUb761YPo-emQwt2sw2IMvUHm-'; // Default image URL

  static List<String> getTitles() {
    return data.keys.toList();
  }

  static String getSubtitle(String title) {
    return data[title]?['subtitle'] ?? '';
  }

  static String getImagePath(String title) {
    return data[title]?['imagePath'] ?? '';
  }
}
