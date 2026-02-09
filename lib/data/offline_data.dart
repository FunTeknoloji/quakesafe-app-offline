import '../models/emergency_contact.dart';
import '../models/safety_step.dart';

class OfflineData {
  static const contacts = [
    EmergencyContact(
      name: 'AFAD Acil',
      phone: '122',
      description: 'Afet ve acil durum çağrı merkezi',
    ),
    EmergencyContact(
      name: 'Acil Sağlık',
      phone: '112',
      description: 'Yaralanma ve tıbbi acil destek',
    ),
    EmergencyContact(
      name: 'İtfaiye',
      phone: '110',
      description: 'Yangın ve arama-kurtarma desteği',
    ),
  ];

  static const duringQuake = [
    SafetyStep(
      title: 'Çök - Kapan - Tutun',
      description: 'Sağlam bir masa altına geçip baş-boyun bölgenizi koruyun.',
    ),
    SafetyStep(
      title: 'Asansör Kullanmayın',
      description: 'Sarsıntı bitene kadar bulunduğunuz yerde güvenli kalın.',
    ),
    SafetyStep(
      title: 'Pencerelerden Uzak Durun',
      description: 'Cam kırıkları riskine karşı iç duvar hattında kalın.',
    ),
  ];

  static const afterQuake = [
    SafetyStep(
      title: 'Gaz ve Elektrik Kontrolü',
      description: 'Sızıntı şüphesinde vanaları kapatın ve yetkiliyi arayın.',
    ),
    SafetyStep(
      title: 'Toplanma Alanına Geçin',
      description: 'Ailenizle önceden belirlediğiniz güvenli noktada buluşun.',
    ),
    SafetyStep(
      title: 'SMS/Veri Önceliği',
      description: 'Hat yoğunluğu için kısa mesaj veya internet tabanlı iletişim kullanın.',
    ),
  ];
}
