# 일반화선형모형

# 주제
- 지구근처 소행성 종류 분류 및 잠재적 위험 유무 판별

# 배경 & 프로젝트 목표
- NASA에 따르면 지구 근처에 있는 잠재적 충돌 위험이 있는 소행성들이 존재
- 지구 근처에 있는 소행성들의 종류(Apollo, Amor, Aten)를 판별 & 잠재적 충돌 위험성이 있는지 판별

# 일정
- 2023.04 - 2023.06

# 팀원수 & 맡은 역할
- 3명 / 데이터 전처리 및 보고서 작성
  

# 데이터
- NASA의 Near Earth Object Program의 Jet Propulsion Laboratory(California Institute of Technology) 연구소에서 수집된 데이터이고 총 12개의 변수를 가진 15619개의 데이터
1. Object.Classification (Y ): Orbit classification
2. Orbit.Axis..AU. (X1): Semi-major axis of the orbit in AU (궤도의 장반축,
AU)
3. Orbit.Eccentricity (X2): Eccentricity of the orbit (궤도의 이심률)
4. Orbit.Inclination..deg. (X3): Inclination of the orbit with respect to the eclip3
tic plane and the equinox of J2000 (J2000-Ecliptic) in degrees (황도면과 J2000
의 분점에 대한 궤도 경사, 도)
5. Perihelion.Argument..deg. (X4): Argument of perihelion (J2000-Ecliptic) in
degrees (근점 편각, 도)
6. Node.Longitude..deg. (X5): Longitude of the ascending node (J2000-Ecliptic)
in degrees (승교점 경도, 도)
7. Mean.Anomoly..deg. (X6): Mean anomoly at epoch in degrees (평균 근점 이
각, 도)
8. Perihelion.Distance..AU. (X7): Perihelion distance of the orbit in AU (궤도의
근일점 거리, AU)
9. Aphelion.Distance..AU. (X8): Aphelion distance of the orbit in AU (AU)(궤
도의 원일점 거리, AU)
10. Orbital.Period..yr. (X9): Orbital period in Julian years (율리우스년의 공전
주기, 년)
11. Minimum.Orbit.Intersection.Distance..AU. (X10): Minimum orbit intersection distance in AU (the minimum distance between the osculating orbits of the
NEO and the Earth) (최소 궤도 교차 거리(NEO와 지구의 진동 궤도 사이의 최소
거리), AU)
12. Asteroid.Magnitude (X11): Absolute V-magnitude (절대등급, V)
∗ AU(Astronomical Unit): 천문단위로 지구에서 태양까지 이르는 평균거리(1AU), 약 1억 5
천만km.


  

# 데이터 전처리
- roboflow라는 툴을 활용하여 헬멧 착용&미착용 이미지의 경우 헬멧을 쓴 경우 helmet, 쓰지 않은 경우 head라고 라벨링한 text파일을 생성
- 전동킥보드 주정차 이미지의 경우 합법으로 주정차 한 경우 legal, 불법으로 주정차 한 경우 illegal이라고 라벨링하여 text파일 생성

# 사용언어/모델
- R/GLM, VGLM

# 모델 성능 지표
- mAP(mean Average Process)

# parameter
- batch size: 40
- epochs: 40

# 결과
- 테스트용 사진으로 결과를 확인한 결과 특정확률로 헬멧 착용, 불법 주정차 여부를 판단함
- map는 78%, precision,recall은 약 96%의 결과를 보임

# 기대효과
- 공유 킥보드 사용자:안전사고 예방, 안전 자가진단
- 지방자치단체: 시민 보행불편 경감, 민원 처리부담 완화
- 공유 킥보드 업체: 공유킥보드 인식 제고, 불법주차 견인비용 절감

