
import 'package:flutter_test/flutter_test.dart';
import 'package:rpl_keamanan/utils/validators.dart';

void main() {
  // ==========================================
  // TEST isValidEmail()
  // ==========================================
  group('isValidEmail', () {
    test('Email valid', () {
      expect(Validators.isValidEmail('user@gmail.com'), isTrue);
      expect(
        Validators.isValidEmail('mahasiswa@amikom.ac.id'),
        isTrue,
      );
    });

    test('Email tidak valid', () {
      expect(Validators.isValidEmail('usergmail.com'), isFalse);
      expect(Validators.isValidEmail('user@'), isFalse);
      expect(Validators.isValidEmail('user@gmail'), isFalse);
      expect(Validators.isValidEmail(''), isFalse);
    });
  });

  // ==========================================
  // TEST sanitize()
  // ==========================================
  group('sanitize', () {
    test('Membersihkan karakter HTML berbahaya', () {
      final input = '<script>alert("XSS")</script>';

      final result = Validators.sanitize(input);

      expect(
        result,
        '&lt;script&gt;alert(&quot;XSS&quot;)&lt;/script&gt;',
      );
    });

    test('Membersihkan tanda kutip dan apostrof', () {
      final input = 'Hello "World" \'Test\'';

      final result = Validators.sanitize(input);

      expect(
        result,
        'Hello &quot;World&quot; &#39;Test&#39;',
      );
    });

    test('Menghapus spasi di awal dan akhir', () {
      expect(Validators.sanitize('  Akbar  '), 'Akbar');
    });
  });

  // ==========================================
  // TEST validateText()
  // ==========================================
  group('validateText', () {
    test('Text valid', () {
      expect(Validators.validateText('Akbar'), isNull);
    });

    test('Text kosong', () {
      expect(
        Validators.validateText(''),
        'Field tidak boleh kosong',
      );
    });

    test('Text hanya spasi', () {
      expect(
        Validators.validateText('   '),
        'Field tidak boleh kosong',
      );
    });

    test('Text kurang dari panjang minimum', () {
      expect(
        Validators.validateText('AB', minLength: 3),
        'Field harus antara 3-100 karakter',
      );
    });

    test('Text melebihi panjang maksimum', () {
      expect(
        Validators.validateText('ABCDEFGHIJK', maxLength: 10),
        'Field harus antara 1-10 karakter',
      );
    });

    test('Text sesuai batas panjang', () {
      expect(
        Validators.validateText(
          'Akbar',
          minLength: 3,
          maxLength: 10,
        ),
        isNull,
      );
    });
  });
}
