### Flutter CRUD Sample


### 2022-08-19


flutter pub run build_runner build --delete-conflicting-outputs



- [x] Sync လုပ်သင့် မလုပ်သင့် local နဲ့ remote data ကို တိုက်စစ်ရန်။
- [ ] Language ရွေးချယ်ရန် ( English | Myanmar Flag)
- [x] Eng ဆိုရင် local မှာ ထည့်ပေးထားတဲ့ article ငါးပုဒ်လောက်ပဲ ပြရန်
- [ ] FCM with post id
- [x] Favourite Section
- [x] Bottom Navigation Bar
- [x] Category

- [x] Sync Loading Indicator
    sync လုပ်နေတဲ့ အ‌ြေခအနေကို user ကို ပြချင်တာ။ ဘာတွေ ပြမလဲ? server data ရယူနေပါသည်။ 
  - ဆာဗာမှ အချက်အလက်များ ရယူနေပါသည်
  - ဆာဗာတွင် ဆောင်းပါး (၅၀) ရှိပါသည်
  -  ရယူပြီးစီးမှု ၂ / ၅၀ ( ၁၀ % )
  - အောင်မြင်စွာ ရယူပြီးပါပြီ

- [ ] Language ရွေးမယ်။
  - App ကို စစဖွင့်ချင်းမှာ sharedPreference -> language ဆိုပြီး စစ်မယ်
    myanmar ဆိုရင် Myanmar content တွေ ပုံမှန်အတိုင်းပြမယ်
    english ဆိုရင် english endpoint တွေ ပြောင်းခေါ်မယ်။
    ဆိုရရင် data clear လုပ်ပြီး endpoint ပြောင်းခေါ် တာနဲ့ အဆင်ပြေပြီ။
    
clear လုပ်ရာမှာ
သိမ်းထားတာက ဘာရှိလဲ?

ဂဏန်း နဲ့ post တွေ သိမ်းထားတာ ရှိမယ်
cat_ဂဏန်း နဲ့ category တွေ သိမ်းထားတာ ရှိမယ်။
အခု language ဆိုပြီး language သိမ်းထားတာ ရှိမယ်။
ဘာကို ဖြတ်ကြမလဲ?
language က လွဲလို့ ကျန်တာ ဖျတ်။


ဆို language က specify မလုပ်ရသေးဘူး language == language ဆိုရင် 
Language Choose Page ကို ပြမယ်။
Language တစ်ခုကို ရွေးလိုက်ရင် sharedPreference ကို clear
home page ကို သွား။ ( route တစ်ခု လုံးကို clear လုပ်)

ဒါက language ပြောင်းသွားမှ 
ရှိပြီးသားကို နှိပ်ရင် ဘာမှ ဖြစ်ရမှာ မဟုတ်ဘူး။

