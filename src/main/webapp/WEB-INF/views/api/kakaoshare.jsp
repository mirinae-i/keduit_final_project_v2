<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kakao Share</title>
</head>
<body>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js"
  integrity="sha384-x+WG2i7pOR+oWb6O5GV5f1KN2Ko6N7PTGPS7UlasYWNxZMKQA63Cj/B2lbUmUfuC" crossorigin="anonymous"></script>
<script>
  Kakao.init('00b87961be5390073dd46727a7becac6'); // 사용하려는 앱의 JavaScript 키 입력
</script>





<a id="kakaotalk-sharing-btn" href="javascript:;">
  <img src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png"
    alt="카카오톡 공유 보내기 버튼" />
</a>





<script>
  Kakao.Share.createDefaultButton({
    container: '#kakaotalk-sharing-btn',
    objectType: 'location',
    address: '경기 성남시 분당구 판교역로 166 3층',
    addressTitle: '카카오 판교아지트 카페톡',
    content: {
      title: '대피소를 찾아보세요!',
      description: 'Before you die...',
      imageUrl:
        '/webapp/resources/img/share_thumb.jpg',
        //사진 링크 수정 필요
      link: {
        // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
        mobileWebUrl: 'http://localhost:8090',
        webUrl: 'http://localhost:8090',
      },
    },
    social: {
      likeCount: 286,
      commentCount: 45,
      sharedCount: 845,
    },
    buttons: [
      {
        title: '웹으로 보기',
        link: {
          mobileWebUrl: 'http://localhost:8090',
          webUrl: 'http://localhost:8090',
        },
      },
    ],
  });
</script>



</body>
</html>

