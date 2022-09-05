import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/data/utils/neo4j-repository.dart';
import 'package:yaha/domain/domain.dart';

class ImageRepositoryNeo4j extends RepositoryNeo4j<Image>
    implements ImageRepository {
  ImageRepositoryNeo4j({required Ref ref})
      : super(ref: ref, fromJson: Image.fromJson);

  @override
  getImageList() async {
    const String query = r'''
    query images {
      images {
        id
        route {
          id
          coordinates {
            location {
              latitude
              longitude
              height
            }  
          }
        }
        descriptions {
          languageKey
          title
          summary
          fullDescription
          type
        }
      }
    }''';

    return getEntityList(query, 'images');
  }

  @override
  searchImagesAroundLocation(SearchByRadiusInput input) async {
    const String query = r'''
query Query($params: SearchByRadiusInput!) {
  searchImageByRadius(params: $params)
}
    ''';

    return searchEntityByRadius(input, query, 'searchImageByRadius');
  }

  @override
  searchImagesAroundHike(SearchSafeImagesAroundHikeInput input) async {
    const String query = r'''
query Query($params: SearchByRadiusInput!) {
  searchImageByRadius(params: $params)
}
    ''';

    return searchEntityByRadius(input, query, 'searchImageByRadius');
  }

  @override
  getImage(String id) async {
    const String query = r'''
    query images($where: ImageWhere) {
      images(where: $where) {
        id
        route {
          id
          coordinates {
            location {
              latitude
              longitude
              height  
            }
          }
        }
        descriptions {
          languageKey
          title
          summary
          fullDescription
          type
        }
      }
    }''';

    return getEntity(query, id, 'images');
  }
}
