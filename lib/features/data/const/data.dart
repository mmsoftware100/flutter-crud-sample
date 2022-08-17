
import 'package:base/features/domain/entities/binance/bet_type.dart';
import 'package:base/features/domain/entities/binance/quick_select.dart';
import '../../domain/entities/binance/bet_time.dart';

String NUMBER_OF_ARTICLE = "NUMBER_OF_ARTICLE";
String LAST_SYNC_TIME = "LAST_SYNC_TIME";
String CONFIG_ENDPOINT = "https://aungkoman.github.io/married-health/config.json";
String ARTICLE_ENDPOINT = "https://aungkoman.github.io/married-health/posts";
String PHOTO_ENDPOINT = "https://aungkoman.github.io/married-health/photos/";
String CATEGORY_ENDPOINT = "https://aungkoman.github.io/married-health/categories.json";

String appName = "Married Health";
const String appIconUrl = "https://aungkoman.github.io/images/assets/dream_catcher.png"; //"https://i.ibb.co/HhxKg1c/logo.png";
const String imagePlaceholder = "https://i.ibb.co/BcCqJny/image-placeholder.png";
const String appIconAssets = "assets/images/logo.png";
const String defaultYoutubeVideoUrl = "https://www.youtube.com/watch?v=AGtlm_Lzygc";

const int TICKET_CATEGORY_STORE = 1;
const int TICKET_CATEGORY_CART = 2;
const int TICKET_CATEGORY_FAV = 3;
const int TICKET_CATEGORY_ORDER = 4;

BetTime betTime10AM = BetTime(id: 1, time: "10:00 AM");
BetTime betTime12AM = BetTime(id: 2, time: "12:00 AM");
BetTime betTime02PM = BetTime(id: 3, time: "02:00 PM");
BetTime betTime04PM = BetTime(id: 4, time: "04:00 PM");
BetTime betTime06PM = BetTime(id: 5, time: "06:00 PM");

List<BetTime> betTimeList = [
  betTime10AM,
  betTime12AM,
  betTime02PM,
  betTime04PM,
  betTime06PM
];

BetType betTypeMyanmar = BetType(id: 1, name: "Myanmar");
BetType betTypeCrypto = BetType(id: 2, name: "Crypto");
List<BetType> betTypeList = [
  betTypeMyanmar,
  betTypeCrypto
];


int minBetAmount = 100;
List<int> mainList = List.generate(100, (index) => index);

QuickSelect quickSelectSmall = QuickSelect(id: 1, name: "အသေး", digitList: mainList.where((element) => element < 50).toList());
QuickSelect quickSelectBig = QuickSelect(id: 1, name: "အကြီး", digitList: mainList.where((element) => element > 49).toList());
QuickSelect quickSelectEven = QuickSelect(id: 1, name: "စုံ", digitList: mainList.where((element) => element % 2 == 0).toList());
QuickSelect quickSelectOdd = QuickSelect(id: 1, name: "မ", digitList: mainList.where((element) => element % 2 == 1).toList());
QuickSelect quickSelectSame = QuickSelect(id: 1, name: "အပူး", digitList: mainList.where((element) => (element > 10 && element.toString()[0] == element.toString()[1])).toList()..add(0));
QuickSelect quickSelectZero = QuickSelect(id: 1, name: "သုည", digitList: mainList.where((element) =>  element.toString().contains("0")).toList());
QuickSelect quickSelectOne = QuickSelect(id: 1, name: "တစ်", digitList: mainList.where((element) =>  element.toString().contains("1")).toList());
QuickSelect quickSelectTwo = QuickSelect(id: 1, name: "နှစ်", digitList: mainList.where((element) =>  element.toString().contains("2")).toList());
QuickSelect quickSelectThree = QuickSelect(id: 1, name: "သုံး", digitList: mainList.where((element) =>  element.toString().contains("3")).toList());
QuickSelect quickSelectFour = QuickSelect(id: 1, name: "လေး", digitList: mainList.where((element) =>  element.toString().contains("4")).toList());
QuickSelect quickSelectFive = QuickSelect(id: 1, name: "ငါး", digitList: mainList.where((element) =>  element.toString().contains("5")).toList());
QuickSelect quickSelectSix = QuickSelect(id: 1, name: "ခြောက်", digitList: mainList.where((element) =>  element.toString().contains("6")).toList());
QuickSelect quickSelectSeven = QuickSelect(id: 1, name: "ခုနှစ်", digitList: mainList.where((element) =>  element.toString().contains("7")).toList());
QuickSelect quickSelectEight = QuickSelect(id: 1, name: "ရှစ်", digitList: mainList.where((element) =>  element.toString().contains("8")).toList());
QuickSelect quickSelectNine = QuickSelect(id: 1, name: "ကိုး", digitList: mainList.where((element) =>  element.toString().contains("9")).toList());
QuickSelect quickSelectPower = QuickSelect(id: 1, name: "ပါဝါ", digitList: mainList.where((element) =>  element.toString().contains("9")).toList());
QuickSelect quickSelectSatellite = QuickSelect(id: 1, name: "နတ္ခတ်", digitList: mainList.where((element) =>  element.toString().contains("9")).toList());
QuickSelect quickSelectBrother = QuickSelect(id: 1, name: "ညီကို", digitList: mainList.where((element) =>  element.toString().contains("9")).toList());
QuickSelect quickSelectOneTop = QuickSelect(id: 1, name: "၁ ထိပ်", digitList: mainList.where((element) =>  element.toString().contains("9")).toList());
QuickSelect quickSelectOneBottom = QuickSelect(id: 1, name: "ပိတ်", digitList: mainList.where((element) =>  element.toString().contains("9")).toList());

List<QuickSelect> quickSelectList = [
  quickSelectSmall,
  quickSelectBig,
  quickSelectEven,
  quickSelectOdd,
  quickSelectSame,
  quickSelectZero,
  quickSelectOne,
  quickSelectTwo,
  quickSelectThree,
  quickSelectFour,
  quickSelectFive,
  quickSelectSix,
  quickSelectSeven,
  quickSelectEight,
  quickSelectNine
];


//const String backendApiServer = 'http://192.168.1.105/chat-solution/public';
const String backendApiServer = 'https://mmsoftware100.com/dream-catcher/public';
const String apiVersion = backendApiServer+'/api/v1';
const String ticketEndpoint = apiVersion+'/tickets/store';
const String loginEndpoint = apiVersion+'/login';
const String registerEndpoint = apiVersion+'/register';
const String cartEndpoint = apiVersion+'/tickets/cart';
const String favouriteEndpoint = apiVersion+'/tickets/favourite';
const String orderEndpoint = apiVersion+'/tickets/order';

const String CURRENCY = "MMK";


//final String backendApiServer = 'http://192.168.1.124/ecommerce-ooak/public';
//final String backendApiServer = 'https://dev.ooak.jp/api';


const String latestNewsEndpoint = apiVersion+'/latestnews-api';
const String announcementNewsEndpoint = apiVersion+'/announcement-news-api';
const String localNewsEndpoint = apiVersion+'/local-news-api';
const String videoNewsEndpoint = apiVersion+'/videos-api'; // https://www.moi.gov.mm/videos-api
const String liveNewsEndpoint = apiVersion+'/live-news-api';
const String nineObjectiveApi = apiVersion+'/9-objective-api';
const String nameTableApi = apiVersion+'/name-table-api';
const String officeTableApi = apiVersion+'/office-table-api';
const String ministerTableApi = apiVersion+'/minister-table-api';
const String regionMinisterTableApi = apiVersion+'/region-minister-table-api';
const String releaseGroupApi = apiVersion+'/release-group-api';
const String websitesApi = apiVersion+'/websites-api';
const String fiveFutureApi = apiVersion+'/5-future-api';
const String lawApi = apiVersion+'/law-api';
const String articleApi = apiVersion+'/article-api';
const String perspectiveApi = apiVersion+'/perspective-api';
const String councilSpeechApi = apiVersion+'/council-speech-api';
const String conLawApi = apiVersion+'/con-law-api';
const String localNewsApi = apiVersion+'/iprd/other-news-api';
const String newspaperKmApi = apiVersion+'/km/news-paper-api';
const String newspaperMalApi = apiVersion+'/mal/news-paper-api';
const String newspaperNlmApi = apiVersion+'/nlm/news-paper-api';
const String recordApi = apiVersion+'/ppd/records-api';

// https://www.moi.gov.mm/km/news-paper-api
// https://www.moi.gov.mm/iprd/other-news-api
// https://www.moi.gov.mm/con-law-api
// https://www.moi.gov.mm/council-speech-api
// https://www.moi.gov.mm/perspective-api
// https://www.moi.gov.mm/article-api
// https://www.moi.gov.mm/law-api
// https://www.moi.gov.mm/5-future-api
// https://www.moi.gov.mm/websites-api
// https://www.moi.gov.mm/release-group-api
// https://www.moi.gov.mm/region-minister-table-api
 // https://www.moi.gov.mm/minister-table-api
/*
const Category announcementNewsCategory = Category(id: 2, name: "ကြေညာချက်", photo: announcementNewsEndpoint, c);
const Category lawCategory = Category(id: 14, name: "ဥပဒေ", photo: lawApi);
const Category articleCategory = Category(id: 15, name: "ဆောင်းပါး", photo: articleApi);
const Category videoCategory = Category(id: 23, name: "ဗီဒီယိုများ", photo: videoNewsEndpoint);
const Category perspectiveCategory = Category(id: 16, name: "အယ်ဒီတာ့အာဘော်", photo: perspectiveApi);
const Category latestNewsCategory = Category(id: 1, name: "နောက်ဆုံးရသတင်းများ", photo: latestNewsEndpoint);
const Category villegeNewsCategory = Category(id: 19, name: "နယ်သတင်းများ", photo: localNewsApi);
const Category councilSpeechCategory = Category(id: 17, name: "ဥက္ကဌ မိန့်ခွန်းများ", photo: councilSpeechApi);
const Category conLawCategory = Category(id: 18, name: "ဖွဲ့စည်းပုံအခြေခံဥပဒေ", photo: conLawApi);
const Category fiveFutureCategory = Category(id: 13, name: "ရှေ့လုပ်ငန်းစဉ်(၅)ရပ်", photo: fiveFutureApi);
const Category nineObjectiveCategory = Category(id: 6, name: "ဦးတည်ချက် (၉)ရပ်", photo: nineObjectiveApi);
const Category nameTableCategory = Category(id: 7, name: "အုပ်ချုပ်ရေးကောင်စီ အမည်စာရင်း", photo: nameTableApi);
const Category newsPaperKmCategory = Category(id: 20, name: "မြန်မာ့အလင်း", photo: newspaperKmApi);
const Category newsPaperMalCategory = Category(id: 21, name: "ကြေးမုံ", photo: newspaperMalApi);
const Category newsPaperNlmCategory = Category(id: 22, name: "New Light of Myanmar", photo: newspaperNlmApi);
const Category officeTableCategory = Category(id: 8, name: "ပြည်ထောင်စုအဆင့် ရုံးအဖွဲ့အစည်း", photo: officeTableApi);
const Category ministerTableCategory = Category(id: 9, name: "ဝန်ကြီး ဒုဝန်ကြီးများစာရင်း", photo: ministerTableApi);
const Category regionMinisterTableCategory = Category(id: 10, name: "တိုင်း/ပြည်နယ်အစိုးရအဖွဲ့အမည်စာရင်း", photo: ministerTableApi);
const Category releaseGroupCategory = Category(id: 11, name: "သတင်းထုတ်ပြန်ရေးအဖွဲ့", photo: releaseGroupApi);
const Category websiteCategory = Category(id: 12, name: "ဝန်ကြီးဌာန website များ", photo: websitesApi);
const Category recordCategory = Category(id: 12, name: "မြန်မာနိုင်ငံပြန်တမ်းများ", photo: recordApi);

/*
const Category localNewsCategory = Category(id: 3, name: "Local News", endpoint: localNewsEndpoint);
const Category videoNewsCategory = Category(id: 4, name: "Video News", endpoint: videoNewsEndpoint);
const Category liveNewsCategory = Category(id: 5, name: "Live News", endpoint: liveNewsEndpoint);

 */

Map<int, Category> categories = {
  latestNewsCategory.id : latestNewsCategory,
  announcementNewsCategory.id : announcementNewsCategory,
  //localNewsCategory.id : localNewsCategory,
  videoCategory.id : videoCategory,
  //liveNewsCategory.id : liveNewsCategory,
  //nineObjectiveCategory.id : nineObjectiveCategory,
  nameTableCategory.id : nameTableCategory,
  officeTableCategory.id : officeTableCategory,
  ministerTableCategory.id : ministerTableCategory,
  regionMinisterTableCategory.id : regionMinisterTableCategory,
  releaseGroupCategory.id : releaseGroupCategory,
  websiteCategory.id : websiteCategory,
  fiveFutureCategory.id : fiveFutureCategory,
  lawCategory.id : lawCategory,
  articleCategory.id : articleCategory,
  perspectiveCategory.id : perspectiveCategory,
  councilSpeechCategory.id : councilSpeechCategory,
  conLawCategory.id : conLawCategory,
  villegeNewsCategory.id : villegeNewsCategory,
  newsPaperKmCategory.id : newsPaperKmCategory,
  newsPaperMalCategory.id : newsPaperMalCategory,
  newsPaperNlmCategory.id : newsPaperNlmCategory,
  recordCategory.id: recordCategory
};


// SPT Data Section

//const String sptBackendApiServer = 'http://192.168.155.174/wordpress-dooplay-backend-api'; // 192.168.34.174
const String sptBackendApiServer = 'https://shwepannthee.video'; // 192.168.34.174
const String sptApiVersion = sptBackendApiServer+'/api/v1';
/* main two endpoints */
const String sptMetaDataEndpoint = sptApiVersion+'/meta-data';
const String sptVideoEndpoint = sptApiVersion+'/videos';
/* current implementation */
const String sptGenresEndpoint = sptApiVersion+'/genres';
const String sptYearsEndpoint = sptApiVersion+'/years';
const String sptMoviesEndpoint = sptApiVersion+'/movies';
const String sptTvShowsEndpoint = sptApiVersion+'/shows';

String imagenesPhotoOne = "https://image.tmdb.org/t/p/w300/dOsgXftI0iWnhr7yVodguXTAnoA.jpg";
String youtubeIdOne = "https://www.youtube.com/watch?v=fftyn30dVQ4";
String dtPosterSample = "https://image.tmdb.org/t/p/w300/mIh37nBjtYqYwycAAZVnLqHLoXw.jpg";
String dtBackdropSample = "https://image.tmdb.org/t/p/w300/dOsgXftI0iWnhr7yVodguXTAnoA.jpg";
String repeatableFieldsUrl = "https://www.loom.com/embed/638dff235945432d97aa9bec9c6a691a";
String imdbRatingSample = "imdbRating";
String downloadsDoolUrl = "https://mega.nz/file/8s8WCRwY#wAK0JZPuiJ7-DUYm9lT8D-JBFW1qy3t4_sfXK1W7VG8";
String downloadsDoolLang = "MM";
String downloadsDoolSize = "541 MB";
String downloadsDoolType = "Download";
String downloadsDoolQuality = "HD 720";
String downloadDtViewsCount = "10";
String showDataSerie = "Moon Knight";
String showDataTemporada = "1";
String showDataEpisodio = "1";


SptMetaData genreMetaData = SptMetaData(termTaxonomyId: "1", taxonomy: "genres", termId: "termId", name: sptGenresEndpoint);
SptMetaData yearMetaData = SptMetaData(termTaxonomyId: "2", taxonomy: "dtyear", termId: "termId", name: sptYearsEndpoint);
//SptMetaData castMetaData = SptMetaData(termTaxonomyId: "3", taxonomy: "dtcast", termId: "termId", name: "name");
//SptMetaData directorMetaData = SptMetaData(termTaxonomyId: "4", taxonomy: "dtdirector", termId: "termId", name: "name");
Map<String,SptMetaData> metaDataList = {
  genreMetaData.taxonomy : genreMetaData,
  yearMetaData.taxonomy : yearMetaData,
  //castMetaData.taxonomy : castMetaData,
  //directorMetaData.taxonomy : directorMetaData
};


List<SptMetaData> genresList = [
  SptMetaData(termTaxonomyId: "117", taxonomy: "genres", termId: "117", name: "Action"),
  SptMetaData(termTaxonomyId: "118", taxonomy: "genres", termId: "118", name: "Adventure"),
  SptMetaData(termTaxonomyId: "151", taxonomy: "genres", termId: "151", name: "Adult"),
  SptMetaData(termTaxonomyId: "353", taxonomy: "genres", termId: "353", name: "Animation"),
  SptMetaData(termTaxonomyId: "616", taxonomy: "genres", termId: "616", name: "Biography"),
];


List<SptMetaData> yearsList = [
  SptMetaData(termTaxonomyId: "49", taxonomy: "dtyear", termId: "49", name: "1939"),
  SptMetaData(termTaxonomyId: "50", taxonomy: "dtyear", termId: "50", name: "1965"),
  SptMetaData(termTaxonomyId: "51", taxonomy: "dtyear", termId: "51", name: "1980"),
  SptMetaData(termTaxonomyId: "52", taxonomy: "dtyear", termId: "52", name: "1981"),
  SptMetaData(termTaxonomyId: "53", taxonomy: "dtyear", termId: "53", name: "1982"),
];

/*
List<Video> latestMoviesList = [
  Video.sample(),
  Video.sample(),
  Video.sample(),
  Video.sample(),
  Video.sample(),
];

 */


// List<dynamic> dynList = json.decode(fixture('movies_list.json'));
List<Video> latestMoviesList =  [

  Video.sample(),
  Video.sample(),
  Video.sample(),
  Video.sample(),
  Video.sample(),
];


List<Video> latestTvShowsList = [
  Video.sample(),
  Video.sample(),
  Video.sample(),
  Video.sample(),
  Video.sample(),
];

Future<List<Video>> getSampleVideoListFromFixture(String fileName)async{
  List<dynamic> dynList = json.decode(await fixture(fileName));
  List<Video> vidList = [];
  dynList.forEach((e) {
    try{
      vidList.add(VideoModel.fromJson(e).toEntity());
    }
    catch(exp, stackTrace){
      print("inner exp for video model serialization ");
      print(exp);
      print(stackTrace);
    }
  });
  return vidList;

}
 */

