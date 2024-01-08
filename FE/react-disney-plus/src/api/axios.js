import axios from 'axios';

const instance = axios.create({
    baseURL: 'https://api.themoviedb.org/3',
    params: {
        api_key: '65669f11a516170853ecf05dde9a0251',
        language: 'ko-KR'
    }
});

export default instance;